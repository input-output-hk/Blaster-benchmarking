import LiveScripts.Shared
import LiveScripts.S_72da5bbb7697031ada8b9d70e509643eca70501c40adc1496de46e86.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_72da5bbb7697031ada8b9d70e509643eca70501c40adc1496de46e86.script [ctx] 10000]
