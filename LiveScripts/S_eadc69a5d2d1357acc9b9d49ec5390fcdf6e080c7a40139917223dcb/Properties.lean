import LiveScripts.Shared
import LiveScripts.S_eadc69a5d2d1357acc9b9d49ec5390fcdf6e080c7a40139917223dcb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_eadc69a5d2d1357acc9b9d49ec5390fcdf6e080c7a40139917223dcb.script [ctx] 10000]
