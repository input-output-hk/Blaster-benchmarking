import LiveScripts.Shared
import LiveScripts.S_d4e933f6aa5dbd283a0a5f4c51fbb571183b883c35f0173745f5b692.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_d4e933f6aa5dbd283a0a5f4c51fbb571183b883c35f0173745f5b692.script [ctx] 10000]
