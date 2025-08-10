# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_anvil_global_optspecs
	string join \n p/port= a/accounts= balance= timestamp= m/mnemonic= mnemonic-random= mnemonic-seed-unsafe= derivation-path= silent hardfork= b/block-time= slots-in-an-epoch= config-out= no-mining mixed-mining host= order= init= state= s/state-interval= dump-state= load-state= ipc= prune-history= max-persisted-states= transaction-block-keeper= f/fork-url= fork-header= timeout= retries= fork-block-number= fork-transaction-hash= fork-retry-backoff= fork-chain-id= compute-units-per-second= no-rate-limit no-storage-caching gas-limit= disable-block-gas-limit code-size-limit= disable-code-size-limit gas-price= block-base-fee-per-gas= chain-id= steps-tracing disable-console-log auto-impersonate optimism disable-default-create2-deployer memory-limit= alphanet allow-origin= no-cors no-request-size-limit h/help V/version
end

function __fish_anvil_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_anvil_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_anvil_using_subcommand
	set -l cmd (__fish_anvil_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c anvil -n "__fish_anvil_needs_command" -s p -l port -d 'Port number to listen on' -r
complete -c anvil -n "__fish_anvil_needs_command" -s a -l accounts -d 'Number of dev accounts to generate and configure' -r
complete -c anvil -n "__fish_anvil_needs_command" -l balance -d 'The balance of every dev account in Ether' -r
complete -c anvil -n "__fish_anvil_needs_command" -l timestamp -d 'The timestamp of the genesis block' -r
complete -c anvil -n "__fish_anvil_needs_command" -s m -l mnemonic -d 'BIP39 mnemonic phrase used for generating accounts. Cannot be used if `mnemonic_random` or `mnemonic_seed` are used' -r
complete -c anvil -n "__fish_anvil_needs_command" -l mnemonic-random -d 'Automatically generates a BIP39 mnemonic phrase, and derives accounts from it. Cannot be used with other `mnemonic` options. You can specify the number of words you want in the mnemonic. [default: 12]' -r
complete -c anvil -n "__fish_anvil_needs_command" -l mnemonic-seed-unsafe -d 'Generates a BIP39 mnemonic phrase from a given seed Cannot be used with other `mnemonic` options' -r
complete -c anvil -n "__fish_anvil_needs_command" -l derivation-path -d 'Sets the derivation path of the child key to be derived' -r
complete -c anvil -n "__fish_anvil_needs_command" -l hardfork -d 'The EVM hardfork to use' -r
complete -c anvil -n "__fish_anvil_needs_command" -s b -l block-time -l blockTime -d 'Block time in seconds for interval mining' -r
complete -c anvil -n "__fish_anvil_needs_command" -l slots-in-an-epoch -d 'Slots in an epoch' -r
complete -c anvil -n "__fish_anvil_needs_command" -l config-out -d 'Writes output of `anvil` as json to user-specified file' -r
complete -c anvil -n "__fish_anvil_needs_command" -l host -d 'The hosts the server will listen on' -r
complete -c anvil -n "__fish_anvil_needs_command" -l order -d 'How transactions are sorted in the mempool' -r
complete -c anvil -n "__fish_anvil_needs_command" -l init -d 'Initialize the genesis block with the given `genesis.json` file' -r
complete -c anvil -n "__fish_anvil_needs_command" -l state -d 'This is an alias for both --load-state and --dump-state' -r
complete -c anvil -n "__fish_anvil_needs_command" -s s -l state-interval -d 'Interval in seconds at which the state and block environment is to be dumped to disk' -r
complete -c anvil -n "__fish_anvil_needs_command" -l dump-state -d 'Dump the state and block environment of chain on exit to the given file' -r -F
complete -c anvil -n "__fish_anvil_needs_command" -l load-state -d 'Initialize the chain from a previously saved state snapshot' -r
complete -c anvil -n "__fish_anvil_needs_command" -l ipc -l ipcpath -d 'Launch an ipc server at the given path or default path = `/tmp/anvil.ipc`' -r
complete -c anvil -n "__fish_anvil_needs_command" -l prune-history -d 'Don\'t keep full chain history. If a number argument is specified, at most this number of states is kept in memory' -r
complete -c anvil -n "__fish_anvil_needs_command" -l max-persisted-states -d 'Max number of states to persist on disk' -r
complete -c anvil -n "__fish_anvil_needs_command" -l transaction-block-keeper -d 'Number of blocks with transactions to keep in memory' -r
complete -c anvil -n "__fish_anvil_needs_command" -s f -l fork-url -l rpc-url -d 'Fetch state over a remote endpoint instead of starting from an empty state' -r
complete -c anvil -n "__fish_anvil_needs_command" -l fork-header -d 'Headers to use for the rpc client, e.g. "User-Agent: test-agent"' -r
complete -c anvil -n "__fish_anvil_needs_command" -l timeout -d 'Timeout in ms for requests sent to remote JSON-RPC server in forking mode' -r
complete -c anvil -n "__fish_anvil_needs_command" -l retries -d 'Number of retry requests for spurious networks (timed out requests)' -r
complete -c anvil -n "__fish_anvil_needs_command" -l fork-block-number -d 'Fetch state from a specific block number over a remote endpoint' -r
complete -c anvil -n "__fish_anvil_needs_command" -l fork-transaction-hash -d 'Fetch state from a specific transaction hash over a remote endpoint' -r
complete -c anvil -n "__fish_anvil_needs_command" -l fork-retry-backoff -d 'Initial retry backoff on encountering errors' -r
complete -c anvil -n "__fish_anvil_needs_command" -l fork-chain-id -d 'Specify chain id to skip fetching it from remote endpoint. This enables offline-start mode' -r
complete -c anvil -n "__fish_anvil_needs_command" -l compute-units-per-second -d 'Sets the number of assumed available compute units per second for this provider' -r
complete -c anvil -n "__fish_anvil_needs_command" -l gas-limit -d 'The block gas limit' -r
complete -c anvil -n "__fish_anvil_needs_command" -l code-size-limit -d 'EIP-170: Contract code size limit in bytes. Useful to increase this because of tests. To disable entirely, use `--disable-code-size-limit`. By default, it is 0x6000 (~25kb)' -r
complete -c anvil -n "__fish_anvil_needs_command" -l gas-price -d 'The gas price' -r
complete -c anvil -n "__fish_anvil_needs_command" -l block-base-fee-per-gas -l base-fee -d 'The base fee in a block' -r
complete -c anvil -n "__fish_anvil_needs_command" -l chain-id -d 'The chain ID' -r
complete -c anvil -n "__fish_anvil_needs_command" -l memory-limit -d 'The memory limit per EVM execution in bytes' -r
complete -c anvil -n "__fish_anvil_needs_command" -l allow-origin -d 'The cors `allow_origin` header' -r
complete -c anvil -n "__fish_anvil_needs_command" -l silent -d 'Don\'t print anything on startup and don\'t print logs'
complete -c anvil -n "__fish_anvil_needs_command" -l no-mining -l no-mine -d 'Disable auto and interval mining, and mine on demand instead'
complete -c anvil -n "__fish_anvil_needs_command" -l mixed-mining -l mixed-mining
complete -c anvil -n "__fish_anvil_needs_command" -l no-rate-limit -l no-rpc-rate-limit -d 'Disables rate limiting for this node\'s provider'
complete -c anvil -n "__fish_anvil_needs_command" -l no-storage-caching -d 'Explicitly disables the use of RPC caching'
complete -c anvil -n "__fish_anvil_needs_command" -l disable-block-gas-limit -d 'Disable the `call.gas_limit <= block.gas_limit` constraint'
complete -c anvil -n "__fish_anvil_needs_command" -l disable-code-size-limit -d 'Disable EIP-170: Contract code size limit'
complete -c anvil -n "__fish_anvil_needs_command" -l steps-tracing -l tracing -d 'Enable steps tracing used for debug calls returning geth-style traces'
complete -c anvil -n "__fish_anvil_needs_command" -l disable-console-log -l no-console-log -d 'Disable printing of `console.log` invocations to stdout'
complete -c anvil -n "__fish_anvil_needs_command" -l auto-impersonate -l auto-impersonate -d 'Enable autoImpersonate on startup'
complete -c anvil -n "__fish_anvil_needs_command" -l optimism -l optimism -d 'Run an Optimism chain'
complete -c anvil -n "__fish_anvil_needs_command" -l disable-default-create2-deployer -l no-create2 -d 'Disable the default create2 deployer'
complete -c anvil -n "__fish_anvil_needs_command" -l alphanet -l alphanet -d 'Enable Alphanet features'
complete -c anvil -n "__fish_anvil_needs_command" -l no-cors -d 'Disable CORS'
complete -c anvil -n "__fish_anvil_needs_command" -l no-request-size-limit -d 'Disable the default request body size limit. At time of writing the default limit is 2MB'
complete -c anvil -n "__fish_anvil_needs_command" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c anvil -n "__fish_anvil_needs_command" -s V -l version -d 'Print version'
complete -c anvil -n "__fish_anvil_needs_command" -f -a "completions" -d 'Generate shell completions script'
complete -c anvil -n "__fish_anvil_needs_command" -f -a "com" -d 'Generate shell completions script'
complete -c anvil -n "__fish_anvil_needs_command" -f -a "generate-fig-spec" -d 'Generate Fig autocompletion spec'
complete -c anvil -n "__fish_anvil_needs_command" -f -a "fig" -d 'Generate Fig autocompletion spec'
complete -c anvil -n "__fish_anvil_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c anvil -n "__fish_anvil_using_subcommand completions" -s h -l help -d 'Print help'
complete -c anvil -n "__fish_anvil_using_subcommand com" -s h -l help -d 'Print help'
complete -c anvil -n "__fish_anvil_using_subcommand generate-fig-spec" -s h -l help -d 'Print help'
complete -c anvil -n "__fish_anvil_using_subcommand fig" -s h -l help -d 'Print help'
complete -c anvil -n "__fish_anvil_using_subcommand help; and not __fish_seen_subcommand_from completions generate-fig-spec help" -f -a "completions" -d 'Generate shell completions script'
complete -c anvil -n "__fish_anvil_using_subcommand help; and not __fish_seen_subcommand_from completions generate-fig-spec help" -f -a "generate-fig-spec" -d 'Generate Fig autocompletion spec'
complete -c anvil -n "__fish_anvil_using_subcommand help; and not __fish_seen_subcommand_from completions generate-fig-spec help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
