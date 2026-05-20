npx skills add trustwallet/tw-agent-skills
npx skills add trustwallet/tw-agent-skills -a claude-code
npx skills add trustwallet/tw-agent-skills -a cursor
npx skills add trustwallet/tw-agent-skills -a windsurf
npx skills add trustwallet/tw-agent-skills -a codex
npx skills add trustwallet/tw-agent-skills -a github-copilot
npx skills add trustwallet/tw-agent-skills -a cline
npx skills add trustwallet/tw-agent-skills -a opencode
npx skills add trustwallet/tw-agent-skills -a roo
npx skills add trustwallet/tw-agent-skills -s swap-quote
run-script script_name flags='' sig='' args='':
  sh -c 'FOUNDRY_PROFILE=ci forge script script/{{script_name}}.s.sol {{sig}} {{args}} \
    --rpc-url "https://rpc.buildbear.io/global-wolverine-ff979075" \
    --private-key "0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80" \
    --verifier sourcify \
    --verifier-url "https://rpc.buildbear.io/verify/sourcify/server/global-wolverine-ff979075" \
    -vvvv {{flags}}'

deploy-verify:
  sh -c 'just run-script <SCRIPT_NAME> "--broadcast --verify --slow"'
