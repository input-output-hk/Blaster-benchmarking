import LiveScripts.Shared
import LiveScripts.S_5743de0c6babd9c0afeed658735992647e56fd14f7c7fc1d8499813c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_5743de0c6babd9c0afeed658735992647e56fd14f7c7fc1d8499813c.script [ctx] 10000]
