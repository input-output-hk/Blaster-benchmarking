import LiveScripts.Shared
import LiveScripts.S_cfab823b99b406ba5767ab0acb8a80d1da97a2868c5617e93faa1808.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cfab823b99b406ba5767ab0acb8a80d1da97a2868c5617e93faa1808.script [ctx] 10000]
