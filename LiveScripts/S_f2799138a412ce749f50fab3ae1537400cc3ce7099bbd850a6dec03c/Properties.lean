import LiveScripts.Shared
import LiveScripts.S_f2799138a412ce749f50fab3ae1537400cc3ce7099bbd850a6dec03c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_f2799138a412ce749f50fab3ae1537400cc3ce7099bbd850a6dec03c.script [ctx] 10000]
