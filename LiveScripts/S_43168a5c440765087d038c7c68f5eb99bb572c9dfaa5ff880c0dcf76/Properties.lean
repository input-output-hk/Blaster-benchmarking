import LiveScripts.Shared
import LiveScripts.S_43168a5c440765087d038c7c68f5eb99bb572c9dfaa5ff880c0dcf76.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_43168a5c440765087d038c7c68f5eb99bb572c9dfaa5ff880c0dcf76.script [datum, redeemer, ctx] 10000]
