import LiveScripts.Shared
import LiveScripts.S_2dbc3ffbfd2a179b74853d8d094ada886b488e9fb15866ee735aba5f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2dbc3ffbfd2a179b74853d8d094ada886b488e9fb15866ee735aba5f.script [ctx] 10000]
