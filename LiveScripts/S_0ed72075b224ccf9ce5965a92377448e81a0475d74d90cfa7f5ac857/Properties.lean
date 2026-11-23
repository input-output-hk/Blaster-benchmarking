import LiveScripts.Shared
import LiveScripts.S_0ed72075b224ccf9ce5965a92377448e81a0475d74d90cfa7f5ac857.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_0ed72075b224ccf9ce5965a92377448e81a0475d74d90cfa7f5ac857.script [ctx] 10000]
