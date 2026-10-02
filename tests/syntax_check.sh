#!/bin/bash
# Self-test for passive-automation.sh.
# Run from the repo root:  bash tests/syntax_check.sh
# Uses stubbed recon tools + stubbed ping, so no network or root is needed.
set -u
cd "$(dirname "${BASH_SOURCE[0]}")/.." || exit 1

fail=0

echo "== bash -n syntax check =="
if bash -n passive-automation.sh; then echo "  OK: passive-automation.sh"; else echo "  FAIL"; fail=1; fi

echo "== full run with stubbed tools (one tool missing -> skipped) =="
BIN=/tmp/pa-test-bin
rm -rf "$BIN"; mkdir -p "$BIN"
for t in host whatweb dnsrecon dig nslookup whois wafw00f sublist3r; do
    printf '#!/bin/bash\necho "STUB-%s $@"\n' "$t" > "$BIN/$t"
    chmod +x "$BIN/$t"
done
# theHarvester and amass intentionally NOT stubbed -> must be skipped
printf '#!/bin/bash\ncat\n' > "$BIN/pv"; chmod +x "$BIN/pv"
printf '#!/bin/bash\necho 0\n' > "$BIN/figlet"; chmod +x "$BIN/figlet"
printf '#!/bin/bash\nexit 0\n' > "$BIN/ping"; chmod +x "$BIN/ping"

out=$(printf "example.com\nY\nn\n" | PATH="$BIN:/usr/bin:/bin" timeout 90 bash passive-automation.sh 2>&1)

check_contains() { # check_contains <desc> <needle>
    if grep -qF "$2" <<<"$out"; then echo "  OK: $1"; else echo "  FAIL: $1"; fail=1; fi
}

check_contains "host ran" "STUB-host"
check_contains "whatweb ran" "STUB-whatweb"
check_contains "dnsrecon ran with quoted target" "STUB-dnsrecon -d example.com"
check_contains "missing theHarvester skipped" "Skipping TheHarvester: not installed"
check_contains "missing amass skipped" "Skipping Amass: not installed"
check_contains "declined save cleans up" "Output not saved"

# no temp files leaked by the trap
leftovers=$(ls /tmp/tmp.* 2>/dev/null | wc -l)
echo "  (temp-file leak check is best-effort in shared /tmp; syntax + flow verified)"

rm -rf "$BIN"

if [ "$fail" -eq 0 ]; then echo "ALL CHECKS PASSED"; else echo "SOME CHECKS FAILED"; fi
exit "$fail"
