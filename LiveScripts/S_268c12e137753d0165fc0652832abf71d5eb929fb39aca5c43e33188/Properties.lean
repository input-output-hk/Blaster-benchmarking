import LiveScripts.Shared
import LiveScripts.S_268c12e137753d0165fc0652832abf71d5eb929fb39aca5c43e33188.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_268c12e137753d0165fc0652832abf71d5eb929fb39aca5c43e33188.script [ctx] 10000]
