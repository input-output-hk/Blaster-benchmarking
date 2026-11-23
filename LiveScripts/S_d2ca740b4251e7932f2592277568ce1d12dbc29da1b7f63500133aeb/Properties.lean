import LiveScripts.Shared
import LiveScripts.S_d2ca740b4251e7932f2592277568ce1d12dbc29da1b7f63500133aeb.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d2ca740b4251e7932f2592277568ce1d12dbc29da1b7f63500133aeb.script [ctx] 10000]
