import LiveScripts.Shared
import LiveScripts.S_4730b708f37d24c025f52a66701a622d56d5d1da28ae8c777c3e1ec2.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4730b708f37d24c025f52a66701a622d56d5d1da28ae8c777c3e1ec2.script [ctx] 10000]
