import LiveScripts.Shared
import LiveScripts.S_580bd1b3cd097a3eb20077001417dc0dba94f06c060a6c601c71e976.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_580bd1b3cd097a3eb20077001417dc0dba94f06c060a6c601c71e976.script [ctx] 10000]
