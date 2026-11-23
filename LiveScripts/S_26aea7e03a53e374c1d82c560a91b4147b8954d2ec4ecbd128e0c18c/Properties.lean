import LiveScripts.Shared
import LiveScripts.S_26aea7e03a53e374c1d82c560a91b4147b8954d2ec4ecbd128e0c18c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_26aea7e03a53e374c1d82c560a91b4147b8954d2ec4ecbd128e0c18c.script [datum, redeemer, ctx] 10000]
