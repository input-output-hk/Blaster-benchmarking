import LiveScripts.Shared
import LiveScripts.S_1a4f196d087e4e57ef8715c8f8eae87bd96dba1507f53b2ff60b5425.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1a4f196d087e4e57ef8715c8f8eae87bd96dba1507f53b2ff60b5425.script [ctx] 10000]
