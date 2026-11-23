import LiveScripts.Shared
import LiveScripts.S_a8e050cb6ec4fc6155332e8f41ca76ad50c333397f97a91d513ef5cd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a8e050cb6ec4fc6155332e8f41ca76ad50c333397f97a91d513ef5cd.script [datum, redeemer, ctx] 10000]
