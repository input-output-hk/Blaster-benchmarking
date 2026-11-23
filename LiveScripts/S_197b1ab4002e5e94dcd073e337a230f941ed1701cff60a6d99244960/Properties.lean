import LiveScripts.Shared
import LiveScripts.S_197b1ab4002e5e94dcd073e337a230f941ed1701cff60a6d99244960.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_197b1ab4002e5e94dcd073e337a230f941ed1701cff60a6d99244960.script [ctx] 10000]
