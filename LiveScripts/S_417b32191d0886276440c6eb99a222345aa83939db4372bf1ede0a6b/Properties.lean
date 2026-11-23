import LiveScripts.Shared
import LiveScripts.S_417b32191d0886276440c6eb99a222345aa83939db4372bf1ede0a6b.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_417b32191d0886276440c6eb99a222345aa83939db4372bf1ede0a6b.script [ctx] 10000]
