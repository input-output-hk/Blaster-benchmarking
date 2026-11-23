import LiveScripts.Shared
import LiveScripts.S_ae869384f888eb548f5419d4bbbd8cd178a4f9ab94689363ef25cfa3.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ae869384f888eb548f5419d4bbbd8cd178a4f9ab94689363ef25cfa3.script [ctx] 10000]
