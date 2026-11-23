import LiveScripts.Shared
import LiveScripts.S_af2edb162d35cf3339250a955962d9746fd93ee14dbc88c27aa3be41.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_af2edb162d35cf3339250a955962d9746fd93ee14dbc88c27aa3be41.script [ctx] 10000]
