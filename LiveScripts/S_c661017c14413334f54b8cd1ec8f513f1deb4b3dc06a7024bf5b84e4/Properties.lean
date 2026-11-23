import LiveScripts.Shared
import LiveScripts.S_c661017c14413334f54b8cd1ec8f513f1deb4b3dc06a7024bf5b84e4.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_c661017c14413334f54b8cd1ec8f513f1deb4b3dc06a7024bf5b84e4.script [ctx] 10000]
