import LiveScripts.Shared
import LiveScripts.S_1948aa5c0763723c9274a3bbfc4de31f1eda0eeaee60db533d467e6f.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_1948aa5c0763723c9274a3bbfc4de31f1eda0eeaee60db533d467e6f.script [ctx] 10000]
