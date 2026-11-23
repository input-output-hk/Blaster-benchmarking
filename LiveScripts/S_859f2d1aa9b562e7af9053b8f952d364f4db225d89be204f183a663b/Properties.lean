import LiveScripts.Shared
import LiveScripts.S_859f2d1aa9b562e7af9053b8f952d364f4db225d89be204f183a663b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_859f2d1aa9b562e7af9053b8f952d364f4db225d89be204f183a663b.script [ctx] 10000]
