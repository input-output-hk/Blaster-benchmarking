import LiveScripts.Shared
import LiveScripts.S_da75a8eae20538ec6a822f226bdd0c4408269a709eac9bc362541a9d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_da75a8eae20538ec6a822f226bdd0c4408269a709eac9bc362541a9d.script [ctx] 10000]
