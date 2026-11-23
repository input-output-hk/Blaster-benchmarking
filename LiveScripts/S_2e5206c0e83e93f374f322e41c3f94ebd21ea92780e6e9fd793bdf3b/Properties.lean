import LiveScripts.Shared
import LiveScripts.S_2e5206c0e83e93f374f322e41c3f94ebd21ea92780e6e9fd793bdf3b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2e5206c0e83e93f374f322e41c3f94ebd21ea92780e6e9fd793bdf3b.script [ctx] 10000]
