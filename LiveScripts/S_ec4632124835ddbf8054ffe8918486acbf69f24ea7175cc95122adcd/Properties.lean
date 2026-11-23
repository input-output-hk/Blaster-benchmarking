import LiveScripts.Shared
import LiveScripts.S_ec4632124835ddbf8054ffe8918486acbf69f24ea7175cc95122adcd.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_ec4632124835ddbf8054ffe8918486acbf69f24ea7175cc95122adcd.script [ctx] 10000]
