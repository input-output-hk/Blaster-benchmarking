import LiveScripts.Shared
import LiveScripts.S_c4dd281b20d1f8edc678f6d7dd582d16ff24d321211864a64f23bcb7.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c4dd281b20d1f8edc678f6d7dd582d16ff24d321211864a64f23bcb7.script [ctx] 10000]
