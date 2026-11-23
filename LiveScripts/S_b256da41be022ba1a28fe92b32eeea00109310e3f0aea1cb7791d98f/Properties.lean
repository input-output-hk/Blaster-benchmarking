import LiveScripts.Shared
import LiveScripts.S_b256da41be022ba1a28fe92b32eeea00109310e3f0aea1cb7791d98f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_b256da41be022ba1a28fe92b32eeea00109310e3f0aea1cb7791d98f.script [ctx] 10000]
