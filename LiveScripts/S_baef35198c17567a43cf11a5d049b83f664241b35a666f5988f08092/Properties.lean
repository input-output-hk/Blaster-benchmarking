import LiveScripts.Shared
import LiveScripts.S_baef35198c17567a43cf11a5d049b83f664241b35a666f5988f08092.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_baef35198c17567a43cf11a5d049b83f664241b35a666f5988f08092.script [datum, redeemer, ctx] 10000]
