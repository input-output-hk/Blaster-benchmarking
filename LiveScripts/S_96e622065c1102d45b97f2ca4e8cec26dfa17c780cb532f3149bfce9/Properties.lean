import LiveScripts.Shared
import LiveScripts.S_96e622065c1102d45b97f2ca4e8cec26dfa17c780cb532f3149bfce9.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_96e622065c1102d45b97f2ca4e8cec26dfa17c780cb532f3149bfce9.script [ctx] 10000]
