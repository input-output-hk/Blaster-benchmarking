import LiveScripts.Shared
import LiveScripts.S_a42ee418ed0a42e43e83cb66a1ceedfddab88bd0b99babf8e094e359.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_a42ee418ed0a42e43e83cb66a1ceedfddab88bd0b99babf8e094e359.script [ctx] 10000]
