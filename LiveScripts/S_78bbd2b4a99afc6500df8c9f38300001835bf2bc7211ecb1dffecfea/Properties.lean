import LiveScripts.Shared
import LiveScripts.S_78bbd2b4a99afc6500df8c9f38300001835bf2bc7211ecb1dffecfea.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_78bbd2b4a99afc6500df8c9f38300001835bf2bc7211ecb1dffecfea.script [ctx] 10000]
