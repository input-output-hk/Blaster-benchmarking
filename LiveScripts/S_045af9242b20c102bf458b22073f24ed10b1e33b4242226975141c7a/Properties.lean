import LiveScripts.Shared
import LiveScripts.S_045af9242b20c102bf458b22073f24ed10b1e33b4242226975141c7a.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_045af9242b20c102bf458b22073f24ed10b1e33b4242226975141c7a.script [ctx] 10000]
