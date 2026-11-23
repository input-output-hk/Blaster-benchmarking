import LiveScripts.Shared
import LiveScripts.S_743bdd4f7c53d2efeb5175a02856e660943abda9f124fb1b62fd348d.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_743bdd4f7c53d2efeb5175a02856e660943abda9f124fb1b62fd348d.script [ctx] 10000]
