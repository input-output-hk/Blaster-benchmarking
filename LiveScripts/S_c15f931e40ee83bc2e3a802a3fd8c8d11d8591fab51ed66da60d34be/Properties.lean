import LiveScripts.Shared
import LiveScripts.S_c15f931e40ee83bc2e3a802a3fd8c8d11d8591fab51ed66da60d34be.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c15f931e40ee83bc2e3a802a3fd8c8d11d8591fab51ed66da60d34be.script [ctx] 10000]
