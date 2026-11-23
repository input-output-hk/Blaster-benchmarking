import LiveScripts.Shared
import LiveScripts.S_21ace3a843a7a2ffdc5b54a1145a1439444ad1a520bc85cc2698a91d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_21ace3a843a7a2ffdc5b54a1145a1439444ad1a520bc85cc2698a91d.script [datum, redeemer, ctx] 10000]
