import LiveScripts.Shared
import LiveScripts.S_fbde7dd06f85b1e5c893d12ffad21f01ce09e1cce3aa4e113e94b2d0.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_fbde7dd06f85b1e5c893d12ffad21f01ce09e1cce3aa4e113e94b2d0.script [ctx] 10000]
