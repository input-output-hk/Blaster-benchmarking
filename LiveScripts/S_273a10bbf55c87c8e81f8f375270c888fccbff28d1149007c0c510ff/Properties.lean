import LiveScripts.Shared
import LiveScripts.S_273a10bbf55c87c8e81f8f375270c888fccbff28d1149007c0c510ff.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_273a10bbf55c87c8e81f8f375270c888fccbff28d1149007c0c510ff.script [ctx] 10000]
