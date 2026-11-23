import LiveScripts.Shared
import LiveScripts.S_cfdd3b08ff749510404b9ff51baeaad83ff69a826158cad216679333.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_cfdd3b08ff749510404b9ff51baeaad83ff69a826158cad216679333.script [ctx] 10000]
