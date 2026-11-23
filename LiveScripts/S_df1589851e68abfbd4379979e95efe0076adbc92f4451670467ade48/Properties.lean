import LiveScripts.Shared
import LiveScripts.S_df1589851e68abfbd4379979e95efe0076adbc92f4451670467ade48.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_df1589851e68abfbd4379979e95efe0076adbc92f4451670467ade48.script [ctx] 10000]
