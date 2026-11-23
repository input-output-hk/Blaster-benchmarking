import LiveScripts.Shared
import LiveScripts.S_a9c846aa9ecb2b2208122029b9459fd95f2f776090f41c1a9a99ce59.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a9c846aa9ecb2b2208122029b9459fd95f2f776090f41c1a9a99ce59.script [datum, redeemer, ctx] 10000]
