import LiveScripts.Shared
import LiveScripts.S_c0faee9bf4f5fd14d400911b8db3adc7ea805a633aa85d2c1430ac35.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c0faee9bf4f5fd14d400911b8db3adc7ea805a633aa85d2c1430ac35.script [ctx] 10000]
