import LiveScripts.Shared
import LiveScripts.S_12e238f573de762a29d36eba2f6f89bb39c1a402800f2e8afd5942f8.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_12e238f573de762a29d36eba2f6f89bb39c1a402800f2e8afd5942f8.script [ctx] 10000]
