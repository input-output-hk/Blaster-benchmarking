import LiveScripts.Shared
import LiveScripts.S_df6f292ece90837f738ef156f8940e5f98db2027b3afa8d2041c492d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_df6f292ece90837f738ef156f8940e5f98db2027b3afa8d2041c492d.script [ctx] 10000]
