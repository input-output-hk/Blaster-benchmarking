import LiveScripts.Shared
import LiveScripts.S_e9db2daceede726e614b9bd0470a941423f85790d4856b7965ae0de8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_e9db2daceede726e614b9bd0470a941423f85790d4856b7965ae0de8.script [ctx] 10000]
