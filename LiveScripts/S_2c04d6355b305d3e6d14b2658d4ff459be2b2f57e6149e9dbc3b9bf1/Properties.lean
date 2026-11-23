import LiveScripts.Shared
import LiveScripts.S_2c04d6355b305d3e6d14b2658d4ff459be2b2f57e6149e9dbc3b9bf1.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2c04d6355b305d3e6d14b2658d4ff459be2b2f57e6149e9dbc3b9bf1.script [ctx] 10000]
