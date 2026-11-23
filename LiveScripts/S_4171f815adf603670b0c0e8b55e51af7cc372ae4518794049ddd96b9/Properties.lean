import LiveScripts.Shared
import LiveScripts.S_4171f815adf603670b0c0e8b55e51af7cc372ae4518794049ddd96b9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4171f815adf603670b0c0e8b55e51af7cc372ae4518794049ddd96b9.script [ctx] 10000]
