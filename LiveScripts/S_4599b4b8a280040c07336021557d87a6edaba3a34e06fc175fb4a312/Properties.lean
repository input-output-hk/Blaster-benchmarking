import LiveScripts.Shared
import LiveScripts.S_4599b4b8a280040c07336021557d87a6edaba3a34e06fc175fb4a312.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_4599b4b8a280040c07336021557d87a6edaba3a34e06fc175fb4a312.script [ctx] 10000]
