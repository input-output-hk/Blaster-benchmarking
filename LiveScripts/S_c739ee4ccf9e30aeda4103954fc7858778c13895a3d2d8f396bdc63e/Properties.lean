import LiveScripts.Shared
import LiveScripts.S_c739ee4ccf9e30aeda4103954fc7858778c13895a3d2d8f396bdc63e.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c739ee4ccf9e30aeda4103954fc7858778c13895a3d2d8f396bdc63e.script [ctx] 10000]
