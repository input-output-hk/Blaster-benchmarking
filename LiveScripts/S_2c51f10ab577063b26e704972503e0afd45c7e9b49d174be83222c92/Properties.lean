import LiveScripts.Shared
import LiveScripts.S_2c51f10ab577063b26e704972503e0afd45c7e9b49d174be83222c92.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2c51f10ab577063b26e704972503e0afd45c7e9b49d174be83222c92.script [ctx] 10000]
