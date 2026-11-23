import LiveScripts.Shared
import LiveScripts.S_badff470870499324c16c738cc85378b00300e01e1444b23c8fd2022.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ datum redeemer ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_badff470870499324c16c738cc85378b00300e01e1444b23c8fd2022.script [datum, redeemer, ctx] 10000]
