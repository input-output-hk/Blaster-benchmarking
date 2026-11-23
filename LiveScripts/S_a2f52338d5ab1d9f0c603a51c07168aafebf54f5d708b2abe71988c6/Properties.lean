import LiveScripts.Shared
import LiveScripts.S_a2f52338d5ab1d9f0c603a51c07168aafebf54f5d708b2abe71988c6.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a2f52338d5ab1d9f0c603a51c07168aafebf54f5d708b2abe71988c6.script [datum, redeemer, ctx] 10000]
